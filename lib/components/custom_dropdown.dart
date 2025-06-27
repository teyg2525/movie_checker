import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_checker/gen/assets.gen.dart';
import 'package:movie_checker/style/text_styles.dart';

class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown(
    this.items,
    this.selectedItem,
    this.itemChanged, {
    this.selectedItems,
    this.title = '',
    this.placeholder = '',
    this.enabled = true,
    this.expanded = false,
    this.icon,
    super.key,
  });

  final T? selectedItem;
  final List<DropdownMenuItem<T>> items;
  final List<Widget>? selectedItems;
  final Function(dynamic) itemChanged;
  final String title;
  final String placeholder;
  final bool enabled;
  final Widget? icon;
  final bool expanded;

  @override
  State<StatefulWidget> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown> {
  T? _currentItem;

  @override
  void initState() {
    super.initState();

    _currentItem = _lastItem = widget.selectedItem;
  }

  T? _lastItem;

  @override
  Widget build(BuildContext context) {
    final textStyles = TextStyles.of(context);

    if (widget.selectedItem != _lastItem) {
      _currentItem = _lastItem = widget.selectedItem;
    }

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(widget.title, style: textStyles.roboto14RegularMain),
          ),
        ),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(color: textStyles.ctaDisabledColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                isExpanded: widget.expanded,
                enableFeedback: widget.enabled,
                hint: Text(
                  widget.placeholder,
                  style: textStyles.roboto14RegularSecondary,
                ),
                selectedItemBuilder: widget.selectedItems != null
                    ? (context) => widget.selectedItems!
                    : null,
                value: _currentItem,
                items: widget.items,
                onChanged: widget.enabled ? _onItemChanged : null,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onItemChanged(dynamic item) {
    setState(() {
      _currentItem = item;
    });

    widget.itemChanged(item);
  }
}
