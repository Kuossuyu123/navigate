import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}



class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> _selectedItem = ValueNotifier('');

    const items = <String>[
      '第一項', '第二項', '第三項', '第四項', '第五項', '第六項', '第七項', '第八項',
    ];
    const icons = <String>[
      'assets/image1.png', 'assets/image2.jpg', 'assets/image3.jpg', 'assets/image4.jpg',
      'assets/image5.jpg', 'assets/image6.jpg', 'assets/image7.jpg', 'assets/image8.jpg',
    ];
    const texts = <String>[
      '天官賜福', '綠蔭之冠', '偷偷藏不住', '咒術迴戰',
      '間諜家家酒', '戀是櫻草色', '魔道祖師', '天涯客',
    ];

    return Scaffold(

        appBar: AppBar(
          title: const Text('Second Route'),
        ),

        body: ListView.builder(

          itemCount: items.length,
          itemBuilder: (context, index) =>
              Card(
                child: ListTile(title: Text(
                  items[index], style: const TextStyle(fontSize: 20),),
                  onTap: () {'點選' + items[index];},//=> _selectedItem.value = '點選' + items[index],
                  leading: Container(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(icons[index],),),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 5),),
                  subtitle: Text(
                    texts[index], style: const TextStyle(fontSize: 16),),),
              ),
        )
    );
  }
}

