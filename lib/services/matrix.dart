import 'dart:math';

class Matrix {
  static List<List<num>> toMatrix(String matrixString, int row, int column) {
    int index = 0;

    if (row == 1 && column == 1)
      return [
        [num.parse(matrixString)]
      ];

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

  static String toLatex(List<List<num>> matrix, {bool isDeterminant = false}) {
    String latex = isDeterminant ? '\\begin{vmatrix}' : '\\begin{bmatrix}';

    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        if (j < matrix[i].length - 1)
          latex += matrix[i][j].toString() + ' & ';
        else
          latex += matrix[i][j].toString();
      }

      if (i < matrix.length - 1) latex += ' \\\\ ';
    }

    latex += isDeterminant ? '\\end{vmatrix}' : '\\end{bmatrix}';

    return latex;
  }

  static bool isSquare(List<List<num>> matrix) => matrix.length == matrix[0].length;

  static bool canDoProduct(List<List<num>> matrix1, List<List<num>> matrix2) => matrix1[0].length == matrix2.length;

  static bool areOfSameSize(List<List<num>> matrix1, List<List<num>> matrix2) =>
      (matrix1.length == matrix2.length) && (matrix1[0].length == matrix2[0].length);

  static bool canConvertToMatrix(int row, int column, String matrix) => matrix.split(',').length == (row * column);

  static List<String> add(List<List<num>> matrix1, List<List<num>> matrix2) {
    List<String> steps = <String>[];
    String answer = '\\begin{bmatrix}';

    for (int i = 0; i < matrix1.length; i++) {
      for (int j = 0; j < matrix1[i].length; j++) {
        steps.add('C_{${i + 1}${j + 1}} = ${matrix1[i][j]} + ${matrix2[i][j]} = ${matrix1[i][j] + matrix2[i][j]}');

        if (j < matrix1[i].length - 1)
          answer += (matrix1[i][j] + matrix2[i][j]).toString() + ' & ';
        else
          answer += (matrix1[i][j] + matrix2[i][j]).toString();
      }

      if (i < matrix1.length - 1) answer += ' \\\\ ';
    }

    answer += '\\end{bmatrix}';
    steps.add(answer);

    return steps;
  }

  static List<String> subtract(List<List<num>> matrix1, List<List<num>> matrix2) {
    List<String> steps = <String>[];
    String answer = '\\begin{bmatrix}';

    for (int i = 0; i < matrix1.length; i++) {
      for (int j = 0; j < matrix1[i].length; j++) {
        steps.add('C_{${i + 1}${j + 1}} = ${matrix1[i][j]} - ${matrix2[i][j]} = ${matrix1[i][j] - matrix2[i][j]}');

        if (j < matrix1[i].length - 1)
          answer += (matrix1[i][j] - matrix2[i][j]).toString() + ' & ';
        else
          answer += (matrix1[i][j] - matrix2[i][j]).toString();
      }

      if (i < matrix1.length - 1) answer += ' \\\\ ';
    }

    answer += '\\end{bmatrix}';
    steps.add(answer);

    return steps;
  }

  static List<String> product(List<List<num>> matrix1, List<List<num>> matrix2) {
    List<String> steps = <String>[];
    String step = '';
    String finalStep = '\\begin{bmatrix}';
    num a = 0;

    for (int i = 0; i < matrix1.length; i++) {
      for (int j = 0; j < matrix2[i].length; j++) {
        step += 'C_{${i + 1}${j + 1}} = ';

        for (int k = 0; k < matrix1[i].length; k++) {
          a += matrix1[i][k] * matrix2[k][j];

          if (k == matrix1[i].length - 1) {
            if (matrix2[k][j] < 0)
              step += '(${matrix1[i][k]} * (${matrix2[k][j]}))';
            else
              step += '(${matrix1[i][k]} * ${matrix2[k][j]})';
          } else {
            if (matrix2[k][j] < 0)
              step += '(${matrix1[i][k]} * (${matrix2[k][j]})) +';
            else
              step += '(${matrix1[i][k]} * ${matrix2[k][j]}) +';
          }
        }

        if (j < matrix2[i].length - 1)
          finalStep += '$a & ';
        else
          finalStep += a.toString();

        steps.add(step);
        step = '';
        a = 0;
      }

      if (i < matrix1.length - 1) finalStep += ' \\\\ ';
    }

    finalStep += '\\end{bmatrix}';
    steps.add(finalStep);

    return steps;
  }

  static Map<String, dynamic> transpose(List<List<num>> matrix) {
    List<String> steps = <String>[];
    List<List<num>> answerMatrix = List<List<num>>.generate(matrix[0].length, (int index) {
      List temp = <num>[];
      for (int i = 0; i < matrix.length; i++) {
        temp.add(0);
      }

      return temp;
    });
    int a = 0;
    int b = 0;
    String answer = '\\begin{bmatrix}';

    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        answerMatrix[a][b] = matrix[i][j];
        steps.add('C_{${a + 1}${b + 1}} = A_{${i + 1}${j + 1}} = ${matrix[i][j]}');

        if (a == answerMatrix.length - 1) {
          a = 0;
          b++;
        } else {
          a++;
        }
      }
    }

    for (int i = 0; i < answerMatrix.length; i++) {
      for (int j = 0; j < answerMatrix[i].length; j++) {
        if (j < answerMatrix[i].length - 1)
          answer += answerMatrix[i][j].toString() + ' & ';
        else
          answer += answerMatrix[i][j].toString();
      }

      if (i < answerMatrix[i].length) answer += ' \\\\ ';
    }

    answer += '\\end{bmatrix}';
    steps.add(answer);

    return {'steps': steps, 'matrix': answerMatrix};
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

  static Map<String, dynamic> adjoint(List<List<num>> matrix) {
    if (matrix.length == 1) {
      return {
        'steps': ['\\begin{bmatrix}${matrix[0][0]}\\end{bmatrix}'],
        'matrix': [
          [matrix[0][0]]
        ]
      };
    } else {
      Map<String, dynamic> transposeMatrix = <String, dynamic>{};
      List<String> steps = <String>[];
      List<List<num>> answerMatrix = <List<num>>[];
      String step = '\\begin{bmatrix}';

      for (int i = 0; i < matrix.length; i++) {
        answerMatrix.add([]);
        for (int j = 0; j < matrix[i].length; j++) {
          Map<String, dynamic> cofactor = getCofactor(matrix, i, j);
          Map<String, dynamic> det = determinant(cofactor['matrix']);

          print(pow(-1, (i + 1) * (j + 1)));

          answerMatrix[i].add(pow(-1, i + j + 2) * det['answer']);

          if (pow(-1, (i + j + 2)) == 1) {
            steps.add('C_{${i + 1}${j + 1}} = ${cofactor['step']}');
          } else {
            steps.add('C_{${i + 1}${j + 1}} = -(${cofactor['step']})');
          }
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

      step += '\\end{bmatrix}^T';
      steps.add(step);

      transposeMatrix = transpose(answerMatrix);
      steps.addAll(transpose(answerMatrix)['steps']);

      return {'steps': steps, 'matrix': transposeMatrix['matrix']};
    }
  }

  static List<String> inverse(List<List<num>> matrix) {
    List<String> steps = <String>[];
    Map<String, dynamic> adjMatrix = <String, dynamic>{};
    Map<String, dynamic> det = <String, dynamic>{};
    String finalStep = '\\begin{bmatrix}';

    adjMatrix = adjoint(matrix);
    det = determinant(matrix);
    steps.addAll(adjMatrix['steps']);
    steps.addAll(det['steps']);

    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        steps.addAll([
          'C_{${i + 1}${j + 1}} = \\frac{1}{${det['answer']}}*A_{${i + 1}${j + 1}} = \\frac{1}{${det['answer']}}*${adjMatrix['matrix'][i][j]}',
          'C_{${i + 1}${j + 1}} = ${1 / det['answer'] * adjMatrix['matrix'][i][j]}',
        ]);

        if (j < matrix[i].length - 1)
          finalStep += '${1 / det['answer'] * adjMatrix['matrix'][i][j]} &';
        else
          finalStep += '${1 / det['answer'] * adjMatrix['matrix'][i][j]}';
      }

      if (i < matrix.length - 1) finalStep += ' \\\\ ';
    }
    finalStep += '\\end{bmatrix}';
    steps.add(finalStep);

    return steps;
  }
}
