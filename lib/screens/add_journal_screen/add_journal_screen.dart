import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  AddJournalScreen({super.key, required this.journal});
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${WeekDay(journal.createdAt.weekday).long.toLowerCase()}, ${journal.createdAt.day} | ${journal.createdAt.month} | ${journal.createdAt.year}",
        ),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal();
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }

  registerJournal() {
    String content = _contentController.text;

    journal.content = content;
    JournalService service = JournalService();
    service.register(journal);
  }
}
