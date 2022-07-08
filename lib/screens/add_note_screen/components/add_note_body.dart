import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';
import '/provider/notes.dart';
import '/utils/utils.dart';
import '/widgets/default_button.dart';
import '/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'custom_text_field.dart';
import 'date_container.dart';

import 'time_container.dart';

class AddNoteBody extends StatefulWidget {
  AddNoteBody({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionContoreller = TextEditingController();
  var isImportant = false;
  @override
  Widget build(BuildContext context) {
    final note = Provider.of<Notes>(context);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBigText(
              text: 'Add New \nNote',
              color: Colors.white,
              size: getProportionateScreenHeight(36),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            CustomTextField(
              label: 'Note Title',
              controller: titleController,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            SizedBox(height: getProportionateScreenHeight(20)),
            const PickTimeAndDate(),
            SizedBox(height: getProportionateScreenHeight(10)),
            CustomTextField(
              label: 'Description',
              controller: descriptionContoreller,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            GestureDetector(
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/flame-svgrepo-com.svg',
                    width: 30,
                    color: isImportant
                        ? AppColors.kOrangeColor
                        : AppColors.kLightTextColor,
                  ),
                  SizedBox(width: getProportionateScreenWidth(5)),
                  AppSmallText(
                    text: 'Important Note',
                    color: Colors.white,
                    size: getProportionateScreenHeight(18),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  isImportant = !isImportant;
                });
        
              },
            ),
            SizedBox(height: getProportionateScreenHeight(35)),
            DefaultButton(
                text: 'Add Note',
                press: () {
                  if (titleController.text.isEmpty &&
                      descriptionContoreller.text.isEmpty) {
                    return;
                  }
                  note.addNote(isImportant, titleController.text,
                      descriptionContoreller.text);
                  Navigator.of(context).pop();
                  print(isImportant.toString());
                })
          ],
        ),
      ),
    );
  }
}

class PickTimeAndDate extends StatefulWidget {
  const PickTimeAndDate({
    Key? key,
  }) : super(key: key);

  @override
  State<PickTimeAndDate> createState() => _PickTimeAndDateState();
}

class _PickTimeAndDateState extends State<PickTimeAndDate> {
  TimeOfDay? _timeToStart;
  TimeOfDay? _timeToFinish;
  DateTime? _selectedDate;

  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dial);
    if (timeOfDay != null) {
      setState(() {
        if (isStart) {
          _timeToStart = timeOfDay;
        } else {
          _timeToFinish = timeOfDay;
        }
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ContainerWithTime(
                title: 'Time to start',
                svgIcon: 'assets/icons/time-speed-svgrepo-com.svg',
                press: () => _selectTime(context, true),
                selectedTime: _timeToStart != null
                    ? '${_timeToStart!.hour.toString().padLeft(2, '0')}:${_timeToStart!.minute.toString().padLeft(2, '0')}'
                    : ' No time \nselected'),
            SizedBox(width: getProportionateScreenWidth(1)),
            ContainerWithTime(
                title: 'Time to finish',
                svgIcon: 'assets/icons/round-done-button-svgrepo-com.svg',
                press: () => _selectTime(context, false),
                selectedTime: _timeToFinish != null
                    ? '${_timeToFinish!.hour.toString().padLeft(2, '0')}:${_timeToFinish!.minute.toString().padLeft(2, '0')}'
                    : ' No time \nselected'),
          ],
        ),
        DateContainer(
          press: () {
            _selectDate(context);
          },
          selectedDate: _selectedDate != null
              ? DateFormat.yMd().format(_selectedDate!)
              : 'No date selected',
        ),
      ],
    );
  }
}
