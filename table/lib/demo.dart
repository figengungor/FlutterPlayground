import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table Playground')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('border: TableBorder.all(color: Colors.orange)'),
              Text('columnWidths: {0: FlexColumnWidth(2)}'),
              Table(
                border: TableBorder.all(color: Colors.orange),
                columnWidths: {1: FlexColumnWidth(2)},
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: [
                  TableRow(
                    children: [
                      Text('Row 1 Column 1'),
                      Text('Row 1 Column 2 Blablaba'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('columnWidths: {1: FlexColumnWidth(2)}'),
              Text(
                  'defaultVerticalAlignment: TableCellVerticalAlignment.bottom'),
              Table(
                border: TableBorder.all(color: Colors.orange),
                columnWidths: {0: FlexColumnWidth(2)},
                defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                children: [
                  TableRow(
                    children: [
                      Text('Row 1 Column 1'),
                      Text('Row 1 Column 2 Blablaba'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('defaultColumnWidth: IntrinsicColumnWidth()'),
              Table(
                border: TableBorder.all(color: Colors.orange),
                defaultColumnWidth: IntrinsicColumnWidth(),
                defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                children: [
                  TableRow(
                    children: [
                      Text('Row 1 Column 1'),
                      Text('Row 1 Column 2 Blablaba'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('defaultColumnWidth: FractionColumnWidth(0.25)'),
              Table(
                border: TableBorder.all(color: Colors.orange),
                defaultColumnWidth: FractionColumnWidth(0.25),
                defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                children: [
                  TableRow(
                    children: [
                      Text('Row 1 Column 1'),
                      Text('Row 1 Column 2 Blablaba'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('defaultColumnWidth: FixedColumnWidth(60)'),
              Table(
                border: TableBorder.all(color: Colors.orange),
                defaultColumnWidth: FixedColumnWidth(60),
                defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                children: [
                  TableRow(
                    children: [
                      Text('Row 1 Column 1'),
                      Text('Row 1 Column 2 Blablaba'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('Nested Tables & borders'),
              Table(
                border: TableBorder.all(color: Colors.orange),
                defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                children: [
                  TableRow(
                    children: [
                      Text('Product'),
                      Table(
                        border: TableBorder(
                            verticalInside: BorderSide(color: Colors.orange),
                            horizontalInside:
                                BorderSide(color: Colors.orange)),
                        children: <TableRow>[
                          TableRow(
                            children: [
                              Text('Max'),
                              Text('Min'),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text('100'),
                              Text('20'),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
