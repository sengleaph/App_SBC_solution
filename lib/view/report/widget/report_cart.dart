import 'package:flutter/material.dart';

class ReportCart extends StatelessWidget {
  const ReportCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: double.maxFinite * .9,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    'https://i.pinimg.com/564x/88/59/97/8859970acc61692e85db8d31c5ee3533.jpg',
                    fit: BoxFit.cover,

                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        maxLines: 2,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Column(
                        children: [
                          Text('day'),
                        ],
                      ),
                      // const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );

  }
}
