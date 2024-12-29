import 'package:flutter/material.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final bool isFavorite; // Initial favorite state
  final ValueChanged<bool> onChanged; // Callback to notify parent about changes
  final double size; // Allows size customization (default: 24)

  const FavoriteButtonWidget({
    super.key,
    required this.isFavorite,
    required this.onChanged,
    this.size = 24,
  });

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    // Initialize the state based on the input
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: _isFavorite ? Colors.red : null,
        size: widget.size,
      ),
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite; // Toggle favorite state
        });
        widget.onChanged(_isFavorite); // Notify parent about the change
      },
    );
  }
}
