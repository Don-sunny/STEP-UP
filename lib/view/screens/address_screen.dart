import 'package:flutter/material.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const SubTitleWidget(
          fontSize: 25,
          text: 'Add Address',
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SubTitleWidget(
              fontSize: 20,
              text: 'Country',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
            const SizedBox(
              height: 50,
            ),
            const SubTitleWidget(
              fontSize: 20,
              text: 'Full Name',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SubTitleWidget(
                        fontSize: 20,
                        text: 'City',
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SubTitleWidget(
                        fontSize: 20,
                        text: 'Postal code',
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const SubTitleWidget(
              fontSize: 20,
              text: 'Delivery Address',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
            const SizedBox(
              height: 50,
            ),
            const SubTitleWidget(
              fontSize: 20,
              text: 'Number we can call',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Continue to payment'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
