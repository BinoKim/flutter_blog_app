import 'package:flutter/material.dart';
import 'package:flutter_blog_app/model/post.dart';
import 'package:flutter_blog_app/ui/write/write_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WritePage extends ConsumerStatefulWidget {
  WritePage(this.post);

  Post? post;

  @override
  ConsumerState<WritePage> createState() => _WritePageState();
}

class _WritePageState extends ConsumerState<WritePage> {
  TextEditingController writeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    writeController.dispose();
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final writeState = ref.watch(writeViewModelProvider(widget.post));
    if (writeState.isWriting) {
      return Scaffold(appBar: AppBar(), body: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () async {
                final result = formKey.currentState?.validate() ?? false;
                if (result) {
                  final vm = ref.read(
                    writeViewModelProvider(widget.post).notifier,
                  );
                  final insertResult = await vm.insert(
                    writer: writeController.text, 
                    title: titleController.text, 
                    content: contentController.text,
                  );
                  if(insertResult) {
                    Navigator.pop(context);
                  }
                }
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              TextFormField(
                controller: writeController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: "Writer"),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Write writer's name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: titleController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: "Title"),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Write the title";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 200,
                child: TextFormField(
                  controller: contentController,
                  maxLines: null,
                  expands: true,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(hintText: "Content"),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Write your content";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Icon(Icons.image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
