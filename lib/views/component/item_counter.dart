import 'package:flutter/material.dart';
import 'package:store_task/views/component/shared.dart';

class ItemCounter extends StatefulWidget {
  final Function? onAmountChanged;

  const ItemCounter({Key? key, this.onAmountChanged}) : super(key: key);

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconWidget(Icons.remove, onPressed: decrementAmount),
        buildSpaceW(8),
        SizedBox(
            width: 30,
            child: Center(
                child: Text(amount.toString(),style: Theme.of(context).textTheme.headline6,))),
        buildSpaceW(8),
        iconWidget(Icons.add, onPressed: incrementAmount)
      ],
    );
  }

  Widget iconWidget(IconData iconData, {Color? iconColor, onPressed}) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: const Color(0xffE2E2E2),
          ),
        ),
        child: Center(
          child: Icon(
            iconData,
            color: iconColor ?? Colors.blue,
            size: 25,
          ),
        ),
      ),
    );
  }

  void incrementAmount() {
    setState(() {
      amount = amount + 1;
      updateParent();
    });
  }

  void decrementAmount() {
    if (amount <= 0) return;
    setState(() {
      amount = amount - 1;
      updateParent();
    });
  }

  void updateParent() {
    if (widget.onAmountChanged != null) {
      widget.onAmountChanged!(amount);
    }
  }
}
