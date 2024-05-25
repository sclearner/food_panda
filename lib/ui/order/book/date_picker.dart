part of 'book_page.dart';

class DatePicker extends StatelessWidget {
  final DateTime date;
  final bool isActive;
  final bool isChosen;

  const DatePicker(
      {super.key,
      required this.date,
      this.isActive = true,
      this.isChosen = false});

  TextStyle notAvailableStyle(BuildContext context) =>
      TextStyle(color: context.colorScheme.shadow);

  @override
  Widget build(BuildContext context) {
    final finalTextStyle = isActive ? null : notAvailableStyle(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat.E().format(date).substring(0, 1),
          style: finalTextStyle,
        ),
        Container(
          height: 32,
          padding: EdgeInsets.symmetric(
              horizontal: max((context.width / 7 - 32) / 2, 0)),
          alignment: Alignment.center,
          child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  fixedSize: const Size(32, 32),
                  padding: EdgeInsets.zero,
                  backgroundColor:
                      isChosen ? context.colorScheme.primary : null,
                  foregroundColor: isChosen
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.onSurface),
              child: Text(date.day.toString(), style: finalTextStyle)),
        )
      ],
    );
  }
}

class TimePicker extends StatelessWidget {
  final bool isActive;
  final String time;

  TimePicker({super.key, this.isActive = false, required this.time});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            textStyle: context.textTheme.labelMedium,
              backgroundColor: isActive ? null : Colors.transparent,
              foregroundColor: isActive ? context.colorScheme.onPrimary : context.colorScheme.onSurface,
              padding: EdgeInsets.zero,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            time,
          )),
    );
  }
}
