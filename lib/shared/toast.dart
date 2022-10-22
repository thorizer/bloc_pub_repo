import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gdm_bloc/app.dart';

class ToastContext extends StatefulWidget {
  @override
  _ToastContextState createState() => _ToastContextState();
}

class _ToastContextState extends State<ToastContext> {
  late FToast fToast;

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("This is a Custom Toast"),
      ],
    ),
  );

  void _showToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  void _showBuilderToast() {
    fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 16.0,
            left: 16.0,
          );
        });
  }

  void _showToastCancel() {
    Widget toastWithButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              "This is a Custom Toast This is a Custom Toast This is a Custom Toast This is a Custom Toast This is a Custom Toast This is a Custom Toast",
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
            ),
            color: Colors.white,
            onPressed: () {
              fToast.removeCustomToast();
            },
          )
        ],
      ),
    );
    fToast.showToast(
      child: toastWithButton,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 50),
    );
  }

  void _queueToasts() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
  }

  void _removeToast() {
    fToast.removeCustomToast();
  }

  void _removeAllQueuedToasts() {
    fToast.removeQueuedCustomToasts();
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(globalKey.currentState!.context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Toasts"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            child: Text("Show Custom Toast"),
            onPressed: () {
              _showToast();
            },
          ),
          ElevatedButton(
            child: Text("Show Custom Toast via PositionedToastBuilder"),
            onPressed: () {
              _showBuilderToast();
            },
          ),
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            child: Text("Custom Toast With Close Button"),
            onPressed: () {
              _showToastCancel();
            },
          ),
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            child: Text("Queue Toasts"),
            onPressed: () {
              _queueToasts();
            },
          ),
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            child: Text("Cancel Toast"),
            onPressed: () {
              _removeToast();
            },
          ),
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            child: Text("Remove Queued Toasts"),
            onPressed: () {
              _removeAllQueuedToasts();
            },
          ),
        ],
      ),
    );
  }
}

Widget toast1 = Container(
  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: Colors.greenAccent,
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.check),
      SizedBox(
        width: 12.0,
      ),
      Text("This is a Custom Toast"),
    ],
  ),
);

void showToast(BuildContext context) {
  FToast gfToast = FToast();
  gfToast.init(globalKey.currentState!.context);
  gfToast.showToast(
    child: dynamicToast(
        context,
        3,
        [
          Text(
            "This is a Custom Toadst with a custom duration",
            style: TextStyle(
              //color: Color.fromARGB(255, 7, 90, 25),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            " ⏱ This is a Custom Toadst ok",
            style: TextStyle(
              //color: Color.fromARGB(255, 7, 90, 25),
              fontSize: 14,
              //fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            " ⏱ This is a Custom Toadst sss dfdfdgfdg fdggdgfgfgfhfdg",
            style: TextStyle(
              //color: Color.fromARGB(255, 7, 90, 25),
              fontSize: 14,
              //fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        ToastColors.success,
        255),
    /* positionedToastBuilder: (context, child) =>  Positioned(
      child: child,
      bottom: 16.0,
      right: 16.0,
    ), */
    gravity: ToastGravity.SNACKBAR,
    toastDuration: Duration(seconds: 2),
  );
}

Widget toast3 = Container(
  height: 100,
  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: Color.fromARGB(255, 118, 160, 134),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: 100,
        width: 15,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 7, 90, 25),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      Icon(Icons.check),
      SizedBox(
        width: 12.0,
      ),
      Text("This is a Custom Toadst s"),
    ],
  ),
);

Widget dynamicToast(BuildContext context, int lines, List<Widget> toastChild,
    ToastColors toastColors, int? alpha) {
  return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.25,
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        minHeight: 80,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: toastColors.background.withAlpha(alpha ?? 255),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: toastSize[lines].barHeight,
                  width: toastSize[lines].barWidth,
                  decoration: BoxDecoration(
                    color: toastColors.foreground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  width: toastSize[lines].sizeboxWidth,
                  height: toastSize[lines].sizeboxHeight,
                  child: Center(
                    child: HeartBeatIcon(
                      color: toastColors.foreground,
                      icon: toastColors.icon ?? Icons.check,
                      size: toastSize[lines].iconSize,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: toastChild,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ));
}

List<ToastSize> toastSize = [
  ToastSize(
    barHeight: 0,
    barWidth: 0,
    sizeboxWidth: 0,
    sizeboxHeight: 0,
    iconSize: 0,
  ),
  ToastSize(
    barHeight: 32,
    barWidth: 15,
    sizeboxWidth: 28,
    sizeboxHeight: 28,
    iconSize: 28,
  ),
  ToastSize(
    barHeight: 55,
    barWidth: 15,
    sizeboxWidth: 55,
    sizeboxHeight: 55,
    iconSize: 55,
  ),
  ToastSize(
    barHeight: 80,
    barWidth: 15,
    sizeboxWidth: 80,
    sizeboxHeight: 80,
    iconSize: 70,
  ),
  ToastSize(
    barHeight: 90,
    barWidth: 15,
    sizeboxWidth: 100,
    sizeboxHeight: 90,
    iconSize: 90,
  ),
  ToastSize(
    barHeight: 110,
    barWidth: 15,
    sizeboxWidth: 110,
    sizeboxHeight: 110,
    iconSize: 110,
  ),
];

class ToastSize {
  final double barHeight;
  final double barWidth;
  final double sizeboxWidth;
  final double sizeboxHeight;
  final double iconSize;

  ToastSize({
    required this.barHeight,
    required this.barWidth,
    required this.sizeboxWidth,
    required this.sizeboxHeight,
    required this.iconSize,
  });
}

enum ToastColors {
  success(
      background: Color.fromARGB(255, 148, 201, 168),
      foreground: Color.fromARGB(255, 7, 90, 25),
      icon: Icons.check_circle_outline),

  error(
      background: Color.fromARGB(255, 251, 180, 175),
      foreground: Color.fromARGB(255, 244, 67, 54),
      icon: Icons.error),
  warning(
      background: Color.fromARGB(255, 228, 208, 149),
      foreground: Color.fromARGB(255, 223, 152, 59),
      icon: Icons.warning),
  info(
      background: Color.fromARGB(255, 188, 223, 255),
      foreground: Color.fromARGB(255, 30, 161, 221),
      icon: Icons.info),
  disconnected(
      background: Color.fromARGB(255, 251, 180, 175),
      foreground: Color.fromARGB(255, 244, 67, 54),
      icon: Icons.cloud_off),
  connected(
      background: Color.fromARGB(255, 148, 201, 168),
      foreground: Color.fromARGB(255, 7, 90, 25),
      icon: Icons.cloud_done),
  unauthorized(
      background: Color.fromARGB(255, 251, 175, 204),
      foreground: Color.fromARGB(255, 181, 0, 84),
      icon: Icons.not_interested),
  connecting(
      background: Color.fromARGB(255, 231, 225, 170),
      foreground: Color.fromARGB(255, 195, 176, 7),
      icon: Icons.rss_feed_rounded),
  reconnecting(
      background: Color.fromARGB(255, 228, 208, 149),
      foreground: Color.fromARGB(255, 223, 152, 59),
      icon: Icons.sync);

  const ToastColors({
    required this.background,
    required this.foreground,
    this.icon,
  });
  final Color background;
  final Color foreground;
  final IconData? icon;
}

class HeartBeatIcon extends StatefulWidget {
  /// The icon that will be animated
  final IconData icon;

  /// The icon color
  final Color color;

  /// The default icon size
  final double size;

  /// Creates a stateful widget that renders a heartbeat animated icon
  const HeartBeatIcon({
    Key? key,
    required this.icon,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  State<HeartBeatIcon> createState() => _HeartBeatIconState();
}

class _HeartBeatIconState extends State<HeartBeatIcon>
    with TickerProviderStateMixin {
  late Animation _heartAnimation;
  late AnimationController _heartAnimationController;

  @override
  void initState() {
    super.initState();
    _heartAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _heartAnimation = Tween(
      begin: widget.size * 0.7,
      end: widget.size * 0.85,
    ).animate(
      CurvedAnimation(
        curve: Curves.bounceOut,
        parent: _heartAnimationController,
      ),
    );

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });
    _heartAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _heartAnimationController,
      builder: (context, child) {
        return Icon(
          widget.icon,
          color: widget.color,
          size: _heartAnimation.value as double?,
        );
      },
    );
  }

  @override
  void dispose() {
    _heartAnimationController.dispose();
    super.dispose();
  }
}

class HeartBeatImage extends StatefulWidget {
  /// The icon that will be animated
  final String imagePath;

  /// The default icon size
  final double width;

  /// Creates a stateful widget that renders a heartbeat animated icon
  const HeartBeatImage({
    Key? key,
    required this.imagePath,
    required this.width,
  }) : super(key: key);

  @override
  State<HeartBeatImage> createState() => _HeartBeatImageState();
}

class _HeartBeatImageState extends State<HeartBeatImage>
    with TickerProviderStateMixin {
  late Animation _heartAnimation;
  late AnimationController _heartAnimationController;

  @override
  void initState() {
    super.initState();
    _heartAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _heartAnimation = Tween(
      begin: widget.width * 0.97,
      end: widget.width * 1,
    ).animate(
      CurvedAnimation(
        curve: Curves.bounceOut,
        parent: _heartAnimationController,
      ),
    );

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });
    _heartAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _heartAnimationController,
      builder: (context, child) {
        //print('assets/images/containerimg/${widget.imagePath}.png');
        return Image.asset(
          'assets/images/containerimg/${widget.imagePath}.png',
          fit: BoxFit.contain,
          width: _heartAnimation.value as double?,
        );
      },
    );
  }

  @override
  void dispose() {
    _heartAnimationController.dispose();
    super.dispose();
  }
}
