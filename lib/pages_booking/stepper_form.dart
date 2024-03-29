import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepperForm extends StatefulWidget {
  const StepperForm({Key? key}) : super(key: key);

  @override
  State<StepperForm> createState() => _StepperFormState();
}

class _StepperFormState extends State<StepperForm> {

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final gender = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final programme = TextEditingController();
  final reference_number = TextEditingController();
  final room_type_id = TextEditingController();
  final guardianName = TextEditingController();
  final guardianPhoneNumber = TextEditingController();
  final hostel = TextEditingController();
  final roomType = TextEditingController();


  bool isComplete = false;
  int currentStep = 0;

  final items = ['none','Luxury Hostel','Elite Hostel','Cassandra Hostel','Lion Hostel','Unity Hostel'];
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
            controller: firstName,
            decoration: const InputDecoration(
                labelText:  " First Name"),
          ),
          TextFormField(
            controller: lastName,
            decoration: const InputDecoration(
                labelText: "Last Name(s)"),
          ),
          TextFormField(
            controller: gender,
            decoration: const InputDecoration(
                labelText: "Gender"),
                      ),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
                labelText: "Email"),
          ),
          TextFormField(
            controller: programme,
            decoration: const InputDecoration(
                labelText: "Programme of study"),
          ),
          TextFormField(
            controller: phoneNumber,
            decoration: const InputDecoration(
                labelText: "Phone Number"),
          ),
          TextFormField(
            controller: reference_number,
            decoration: const InputDecoration(
                labelText: "Reference Number"),
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
            controller: guardianPhoneNumber,
            decoration: const InputDecoration(
                labelText: "Guardian's Phone Number"),
          ),
          TextFormField(
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
          ),
          TextFormField(
            controller: roomType,
            decoration: const InputDecoration(
                labelText:  " Type of room (eg: 4 in 1)"),
          ),
          TextFormField(
            controller: room_type_id,
            decoration: const InputDecoration(
                labelText:  " Type in a number (between 1 - 5)"),
          ),
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
          Text('First Name: ${firstName.text}', style: const TextStyle( fontSize: 20),),
          const SizedBox(height: 15,),
          Text('Last Name: ${lastName.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
          Text('Gender: ${gender.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
          Text('Email: ${email.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
          Text('Programme: ${programme.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
          Text('Phone Number: ${phoneNumber.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
          Text('Reference Number: ${reference_number.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
          Text('Guardian Name: ${guardianName.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
          Text('Guardian Phone Number: ${guardianPhoneNumber.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
          Text('Selected Hostel: ${hostel.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
          Text('Type of room: ${roomType.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
          Text('Room id : ${room_type_id.text}', style: const TextStyle( fontSize: 20)),
          const SizedBox(height: 15,),
        ],
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindly fill this form completely and print it out', style: TextStyle( fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Stepper(
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

                if(currentStep != 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: const Text('BACK'),
                    ),
                  ),
                const SizedBox(width: 30,),
                if(currentStep != 2)
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                  ),
                ),
                const SizedBox(width: 30,),
                if(currentStep != 0 && currentStep != 1)
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text('CONFIRM BOOKING')
                  ),
                ),
                //const SizedBox(width: 30,),
                //if(currentStep != 0 && currentStep != 1)
                //Expanded(
                  //child: ElevatedButton(
                     // onPressed: () {
                       // Navigator.of(context).push(
                           // MaterialPageRoute(builder: (context) => PrintPage(
                               // firstName: firstName.text, lastName: lastName.text, gender: gender.text,email: email.text,
                               // programme: programme.text, phoneNumber: phoneNumber.text, reference_number: reference_number.text,
                               // room_type_id: room_type_id.text,guardianName: guardianName.text, guardianPhoneNumber: guardianPhoneNumber.text,
                                //hostel: hostel.text, roomType: roomType.text))); },
                      //child: const Text('PRINT')
                  //),
                //),
              ],
            );
          },
        ),
      ),
    );
  }

}
