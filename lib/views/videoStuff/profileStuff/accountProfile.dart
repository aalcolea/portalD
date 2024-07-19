import 'package:flutter/material.dart';

class AccountProfileBox extends StatefulWidget {
  const AccountProfileBox({super.key});

  @override
  State<AccountProfileBox> createState() => _AccountProfileBoxState();
}

class _AccountProfileBoxState extends State<AccountProfileBox> {
  String accountName = 'Juanito Rivas';
  List<String> accounts = [
    'Juanito Rivas',
    'Alco',
    'Licho',
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07,
            vertical: 8,
          ),
        ),
        value: accountName.isEmpty ? null : accountName,
        items: accounts.map((String name) {
          return DropdownMenuItem<String>(
            value: name,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(name),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            accountName = newValue!;
          });
        },
        selectedItemBuilder: (BuildContext context) {
          return accounts.map((String name) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            );
          }).toList();
        },
      ),
    );
  }
}
