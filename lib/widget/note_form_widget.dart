import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final String categoria;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String?>? onChangedCategoria;

  const NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    this.categoria = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedCategoria,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Switch(
                    value: isImportant ?? false,
                    onChanged: onChangedImportant,
                  ),
                  Expanded(
                    child: Slider(
                      value: (number ?? 0).toDouble(),
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: (number) => onChangedNumber(number.toInt()),
                    ),
                  )
                ],
              ),
              buildTitle(),
              SizedBox(height: 8),
              buildCategoria(),
              SizedBox(height: 8),
              buildDescription(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'T??tulo',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'El t??tulo no debe estar bacio'
            : null,
        onChanged: onChangedTitle,
      );

  Widget buildCategoria() => Container(
        width: 300,
        child: DropdownButton<String>(
          value: "No hay",
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.green),
          underline: Container(
            height: 2,
            color: Colors.green,
          ),
          onChanged: onChangedCategoria,
          items: <String>['Urgente', 'Media', 'Normal', "No hay"]
              .map<DropdownMenuItem<String>>((String valor) {
            return DropdownMenuItem<String>(
              value: valor,
              child: Text(valor),
            );
          }).toList(),
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Descrioci??n de la nota...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'La descripci??n no puede estar bacia'
            : null,
        onChanged: onChangedDescription,
      );
}
