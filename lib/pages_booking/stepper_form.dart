import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_printing/print_page.dart';

class StepperForm extends StatefulWidget {
  const StepperForm({Key? key}) : super(key: key);

  @override
  State<StepperForm> createState() => _StepperFormState();
}

class _StepperFormState extends State<StepperForm> {

  _StepperFormState(){
    _selectedVal = items[0];
  }



  final surName = TextEditingController();
  final otherName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final guardianName = TextEditingController();
  final address = TextEditingController();
  final guardianPhoneNumber = TextEditingController();
  final hostel = TextEditingController();


  bool isComplete = false;
  int currentStep = 0;

  final items = ['Luxury Hostel','Elite Hostel','Cassandra Hostel','Lion Hostel','Unity Hostel'];
  String ? _selectedVal = '';

  DropdownMenuItem<String>buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(
        item, style: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20,
      ),
      ),);

  List<Step> getSteps() => [
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 0,
      title: const Text("Personal Info"),
      content: Column(
        children: <Widget>[
          TextFormField(
            controller: surName,
            decoration: const InputDecoration(
                labelText:  " Surname"),
          ),
          TextFormField(
            controller: otherName,
            decoration: const InputDecoration(
                labelText: "Other Name(s)"),
          ),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
                labelText: "Email"),
          ),
          TextFormField(
            controller: phoneNumber,
            decoration: const InputDecoration(
                labelText: "Phone Number"),
          )
        ],
      ),

    ),
    Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 1,
      title: const Text("Other info"),
      content: Column(
        children: <Widget>[
          TextFormField(
            controller: guardianName,
            decoration: const InputDecoration(
                labelText: "Guardian's Name"),
          ),
          TextFormField(
            controller: address,
            decoration: const InputDecoration(
                labelText: "Guardian's address"),
          ),
          TextFormField(
            controller: guardianPhoneNumber,
            decoration: const InputDecoration(
                labelText: "Guardian's Phone Number"),
          ),TextFormField(
            controller: hostel,
            decoration: const InputDecoration(
                labelText: "Type in the name of preferred hostel"),
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Select the hostel you typed'
            ),
            value: _selectedVal,
            items: items.map(
                    (e) => DropdownMenuItem(child: Text(e), value: e,)
            ).toList(), onChanged: (val){
            setState(() {
              _selectedVal = val as String;
            });
          },
            icon: const Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.blue,
            ),
          )
        ],
      ),

    ),
    Step(
      state: StepState.complete,
      isActive: currentStep >= 2,
      title: const Text("Complete"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Name: ${surName.text}', style: const TextStyle( fontSize: 20),),
          const SizedBox(height: 25,),
          Text('Last Name(s): ${otherName.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 25,),
          Text('Email: ${email.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 25,),
          Text('Phone Number: ${phoneNumber.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 25,),
          Text('Guardian Name: ${guardianName.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 25,),
          Text('Guardian Address: ${address.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 25,),
          Text('Guardian Phone Number: ${guardianPhoneNumber.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 25,),
          Text('Selected Hostel: ${hostel.text}', style: const TextStyle( fontSize: 20)),
        ],
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindly fill the form and print it out', style: TextStyle( fontSize: 20)),
      ),
      body: Stepper(
        type: StepperType.vertical,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: (){
          final isLastStep = currentStep == getSteps().length -1;
          if(isLastStep){
            setState(() => isComplete = true);
          }

          if(currentStep <(getSteps().length - 1)){
            currentStep += 1;
          }
          setState(() {

          });
        },
        onStepTapped: (step) => setState(() => currentStep = step),
        onStepCancel: (){
          if(currentStep == 0){
            return;
          }
          currentStep -= 1;
          setState(() {

          });
        },
        controlsBuilder:
            (BuildContext context, ControlsDetails details) {
          final isLastStep = currentStep == getSteps().length -1;
          return Row(
            children:  [
              if(currentStep != 2)
              Expanded(
                child: ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                ),
              ),
              const SizedBox(width: 30,),
              if(currentStep != 0)
              Expanded(
                child: ElevatedButton(
                  onPressed: details.onStepCancel,
                  child: const Text('BACK'),
                ),
              ),
              const SizedBox(width: 30,),
              if(currentStep != 0 && currentStep != 1)
              Expanded(
                child: ElevatedButton(
                    onPressed: () { Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PrintPage(
                            surName: surName.text, otherName: otherName.text,email: email.text,
                            phoneNumber: phoneNumber.text,guardianName: guardianName.text,
                            address: address.text, guardianPhoneNumber: guardianPhoneNumber.text,
                            hostel: hostel.text))); },
                    child: const Text('PRINT')
                ),
              ),
            ],
          );
        },
      ),
    );
  }

}
