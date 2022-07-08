// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../utils/utils.dart';
// import '../../../widgets/widgets.dart';

// class ImportantNote extends StatefulWidget {
//   ImportantNote({
//     Key? key,
//     required this.isImportant,
//   }) : super(key: key);

//   bool? isImportant;

//   @override
//   State<ImportantNote> createState() => _ImportantNoteState();
// }

// class _ImportantNoteState extends State<ImportantNote> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Row(
//         children: [
//           SvgPicture.asset(
//             'assets/icons/flame-svgrepo-com.svg',
//             width: 30,
//             color: widget.isImportant!
//                 ? AppColors.kOrangeColor
//                 : AppColors.kLightTextColor,
//           ),
//           SizedBox(width: getProportionateScreenWidth(5)),
//           AppSmallText(
//             text: 'Important Note',
//             color: Colors.white,
//             size: getProportionateScreenHeight(18),
//           ),
//         ],
//       ),
//       onTap: () {
//         setState(() {
//           widget.isImportant = !widget.isImportant!;
//         });
//         print(widget.isImportant);
//       },
//     );
//   }
// }
