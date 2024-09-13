import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Danh sách Học Sinh',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Danh sách Học Sinh'),
        ),
        body: SafeArea(
          child: Center(
            child: StudentTable(),
          ),
        ),
      ),
    );
  }
}

class StudentTable extends StatelessWidget {
  // Danh sách học sinh và điểm của họ
  final Map<String, List<double>> students = {
    'Nguyen Van A': [8.5, 9.0, 7.2],
    'Tran Thi B': [6.8, 5.5, 4.0],
    'Le Hoang C': [9.5, 8.8, 9.0],
    'Pham Dinh D': [7.5, 7.0, 6.8],
  };

  // Phương thức tính điểm trung bình
  double calculateAverage(List<double> scores) {
    double total = 0;
    for (double score in scores) {
      total += score;
    }
    return total / scores.length;
  }

  String classifyStudent(double averageScore) {
    if (averageScore >= 9) {
      return 'Xuất sắc';
    } else if (averageScore >= 8) {
      return 'Giỏi';
    } else if (averageScore >= 7) {
      return 'Khá';
    } else if (averageScore >= 5) {
      return 'Trung bình';
    } else {
      return 'Yếu';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Tên Học Sinh')),
          DataColumn(label: Text('Điểm Trung Bình')),
          DataColumn(label: Text('Phân Loại')),
        ],
        rows: students.entries.map((entry) {
          String studentName = entry.key;
          List<double> scores = entry.value;
          double averageScore = calculateAverage(scores);
          String classification = classifyStudent(averageScore);

          return DataRow(cells: [
            DataCell(Text(studentName)),
            DataCell(Text(averageScore.toStringAsFixed(2))),
            DataCell(Text(classification)),
          ]);
        }).toList(),
      ),
    );
  }
}
