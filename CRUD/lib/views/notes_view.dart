import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/note_controller.dart';
import '../models/note.dart';
import '../models/note_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late NoteController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NoteController(context);
    _controller.fetchNotes();
  }

  // UI for create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _controller.textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              _controller.addNote();
              Navigator.pop(context);
            },
            child: const Text("Create"),
          )
        ],
      ),
    );
  }

  // UI for update a note
  void updateNote(Note note) {
    _controller.textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Update Note"),
          content: TextField(controller: _controller.textController),
          actions: [
            MaterialButton(
                onPressed: () {
                  _controller.updateNote(note.id);
                  Navigator.pop(context);
                },
                child: const Text("Update"))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
        appBar: AppBar(title: const Text('Notes')),
        floatingActionButton: FloatingActionButton(
          onPressed: createNote,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: currentNotes.length,
          itemBuilder: (context, index) {
            final note = currentNotes[index];
            return ListTile(
              title: Text(note.text),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => updateNote(note),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _controller.deleteNote(note.id),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
