import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {"title": "Top Up", "date": "Nov 18, 2024", "amount": "+ \$50.00", "type": "income"},
    {"title": "Purchase", "date": "Nov 16, 2024", "amount": "- \$15.00", "type": "expense"},
    {"title": "Transfer", "date": "Nov 15, 2024", "amount": "- \$200.00", "type": "expense"},
    {"title": "Salary", "date": "Nov 10, 2024", "amount": "+ \$3000.00", "type": "income"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Transaction History',
          style: GoogleFonts.poppins(
            color: Color(0xFF4A4A4A),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your recent transactions are shown below:',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color(0xFF7D7D7D),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200], // Background color untuk daftar
                child: transactions.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.all(16.0),
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = transactions[index];
                          final isIncome = transaction['type'] == 'income';
                          return Card(
                            margin: EdgeInsets.only(bottom: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: Icon(
                                isIncome ? Icons.arrow_circle_up : Icons.arrow_circle_down,
                                color: isIncome ? Colors.green : Colors.red,
                                size: 30,
                              ),
                              title: Text(
                                transaction['title'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                transaction['date'],
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color(0xFF7D7D7D),
                                ),
                              ),
                              trailing: Text(
                                transaction['amount'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: isIncome ? Colors.green : Colors.red,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          'No transactions available',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Color(0xFF7D7D7D),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
