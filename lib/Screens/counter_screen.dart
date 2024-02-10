import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _MyCounterScreenState();
}

class _MyCounterScreenState extends State<CounterScreen> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('contador'),
      )),
      body: Center(
        child: Column(
          children: [
            Text('$contador',
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w400,
                )),
            Text(
              contador == 1 ? 'click' : 'clicks',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icono: Icons.plus_one,
            onPressed: () {
              setState(() {
                contador++;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icono: Icons.exposure_minus_1,
            onPressed: () {
              setState(() {
                if (contador == 0) return;
                contador--;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icono: Icons.refresh_rounded,
            onPressed: () {
              setState(() {
                contador = 0;
              });
            },
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.icono, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icono),
    );
  }
}