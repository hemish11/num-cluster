class Matrix {
  static List<List<num>> toMatrix(String matrixString, int row, int column) {
    int index = 0;

    List<num> input = matrixString.split(',').map((e) => num.parse(e)).toList();
    List<List<num>> matrix = <List<num>>[];

    for (int i = 0; i < row; i++) {
      matrix.add([]);
      for (int j = 0; j < column; j++) {
        matrix[i].add(input[index]);

        index++;
      }
    }

    return matrix;
  }

  static List<String> add(List<List<num>> matrix1, List<List<num>> matrix2) {
    List<String> steps = <String>[];
    String answer = '\\begin{bmatrix}';

    for (int i = 0; i < matrix1.length; i++) {
      for (int j = 0; j < matrix1[i].length; j++) {
        steps.add('C_{$i$j} = ${matrix1[i][j]} + ${matrix2[i][j]} = ${matrix1[i][j] + matrix2[i][j]}');

        if (j < matrix1[i].length - 1)
          answer += (matrix1[i][j] + matrix2[i][j]).toString() + ' & ';
        else
          answer += (matrix1[i][j] + matrix2[i][j]).toString();
      }

      if (i < matrix1.length - 1) answer += ' \\\\ ';
    }

    answer += '\\end{bmatrix}';
    steps.add('\\text{So final answer becomes}' + answer);

    return steps;
  }

  static Map<String, dynamic> getCofactor(List<List<num>> matrix, int p, int q) {
    Map<String, dynamic> result = {'matrix': <List<num>>[], 'step': ''};
    List<List<num>> temp = <List<num>>[];
    String step = '\\begin{vmatrix}';
    int a = 0;
    int b = 0;

    for (int i = 0; i < matrix[0].length - 1; i++) {
      temp.add([]);
      for (int j = 0; j < matrix[0].length - 1; j++) {
        temp[i].add(0);
      }
    }

    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix.length; j++) {
        if (i != p && j != q) {
          temp[a][b] = matrix[i][j];
          step += '${matrix[i][j]}';

          if (b == matrix.length - 2) {
            step += '\\\\';

            b = 0;
            a++;
          } else {
            step += '&';

            b++;
          }
        }
      }
    }

    step += '\\end{vmatrix}';
    step = step.replaceAll('\\\\\\end{vmatrix}', '\\end{vmatrix}');
    result['matrix'] = temp;
    result['step'] = step;

    return result;
  }

  static Map<String, dynamic> calculateDeterminant(List<List<num>> matrix, {List<String> steps}) {
    Map<String, dynamic> result = {'steps': <String>[], 'answer': 0};
    Map<String, dynamic> cofactor = <String, dynamic>{};
    String step = '\\begin{vmatrix}';
    int sign = 1;
    int determinant = 0;

    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        step += '${matrix[i][j]}';

        if (j != matrix[i].length - 1) step += '&';
      }

      if (i != matrix[i].length - 1) step += '\\\\';
    }

    step += '\\end{vmatrix}=';

    if (steps == null) steps = [];

    if (matrix.length == 1) {
      result['steps'].add('D = ${matrix[0][0]}');
      result['answer'] = matrix[0][0];

      return result;
    }

    for (int i = 0; i < matrix.length; i++) {
      cofactor = getCofactor(matrix, 0, i);
      determinant += sign * matrix[0][i] * calculateDeterminant(cofactor['matrix'], steps: steps)['answer'];

      if (sign == 1) {
        if (i == 0) {
          step += '${matrix[0][i]} * ${cofactor['step']}';
        } else {
          step += ' + ${matrix[0][i]} * ${cofactor['step']}';
        }

        sign *= -1;
      } else {
        step += ' - ${matrix[0][i]} * ${cofactor['step']}';
        sign *= -1;
      }
    }

    steps.add(step);

    result['steps'] += steps;
    result['steps'] = result['steps'].reversed.toList();
    result['answer'] = determinant;

    return result;
  }

  static Map<String, dynamic> determinant(List<List<num>> matrix) {
    Map<String, dynamic> det = calculateDeterminant(matrix);

    String step = '\\begin{vmatrix}';

    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        step += '${matrix[i][j]}';

        if (j != matrix[i].length - 1) step += '&';
      }

      if (i != matrix[i].length - 1) step += '\\\\';
    }

    step += '\\end{vmatrix}=${det['answer']}';

    return <String, dynamic>{
      'steps': det['steps'] + [step],
      'answer': det['answer'],
    };
  }

  static List<String> subtract(List<List<num>> matrix1, List<List<num>> matrix2) {
    List<String> steps = <String>[];
    String answer = '\\begin{bmatrix}';

    for (int i = 0; i < matrix1.length; i++) {
      for (int j = 0; j < matrix1[i].length; j++) {
        steps.add('C_{$i$j} = ${matrix1[i][j]} - ${matrix2[i][j]} = ${matrix1[i][j] - matrix2[i][j]}');

        if (j < matrix1[i].length - 1)
          answer += (matrix1[i][j] - matrix2[i][j]).toString() + ' & ';
        else
          answer += (matrix1[i][j] - matrix2[i][j]).toString();
      }

      if (i < matrix1.length - 1) answer += ' \\\\ ';
    }

    answer += '\\end{bmatrix}';
    steps.add('\\text{So final answer becomes}' + answer);

    return steps;
  }

  static List<String> adjoint(List<List<num>> matrix) {
    List<String> steps = <String>[];
    List<List<num>> answerMatrix = <List<num>>[];
    String step = '\\begin{vmatrix}';

    for (int i = 0; i < matrix.length; i++) {
      answerMatrix.add([]);
      for (int j = 0; j < matrix[i].length; j++) {
        Map<String, dynamic> cofactor = getCofactor(matrix, i, j);
        Map<String, dynamic> det = determinant(cofactor['matrix']);

        answerMatrix[i].add(det['answer']);

        steps.add('C_{$i$j} = ${cofactor['step']}');
        steps.addAll(det['steps']);
      }
    }

    for (int i = 0; i < answerMatrix.length; i++) {
      for (int j = 0; j < answerMatrix[i].length; j++) {
        step += '${answerMatrix[i][j]}';

        if (j != answerMatrix[i].length - 1) step += '&';
      }

      if (i != answerMatrix[i].length - 1) step += '\\\\';
    }

    step += '\\end{vmatrix}^T';
    steps.add(step);
    steps.addAll(transpose(matrix));

    return steps;
  }

  static List<String> transpose(List<List<num>> matrix) {
    List<String> steps = <String>[];
    String answer = '\\begin{bmatrix}';

    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        steps.add('C_{$i$j} = A_{$j$i} = ${matrix[j][i]}');

        if (j < matrix[i].length - 1)
          answer += (matrix[j][i]).toString() + ' & ';
        else
          answer += (matrix[j][i]).toString();
      }

      if (i < matrix.length - 1) answer += ' \\\\ ';
    }

    answer += '\\end{bmatrix}';
    steps.add('\\text{So final answer becomes}' + answer);

    return steps;
  }
}
