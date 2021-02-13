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

  static List<String> transpose(List<List<num>> matrix1) {
    List<String> steps = <String>[];
    String answer = '\\begin{bmatrix}';

    for (int i = 0; i < matrix1.length; i++) {
      for (int j = 0; j < matrix1[i].length; j++) {
        steps.add('C_{$i$j} = A_{$j$i} = ${matrix1[j][i]}');

        if (j < matrix1[i].length - 1)
          answer += (matrix1[j][i]).toString() + ' & ';
        else
          answer += (matrix1[j][i]).toString();
      }

      if (i < matrix1.length - 1) answer += ' \\\\ ';
    }

    answer += '\\end{bmatrix}';
    steps.add('\\text{So final answer becomes}' + answer);

    return steps;
  }
}
