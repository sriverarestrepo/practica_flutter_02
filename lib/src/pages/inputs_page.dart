import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _nombre    = '';
  String _email     = '';
  String _password  = '';
  String _fecha     = '';
  String _poderSeleccionado = 'Resistencia';

  List<String> _poderes = ['Super Fuerza','Resistencia','Inmortalidad','Regeneracion'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Inputs'),
       ),
       body: ListView(
         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
         children: <Widget>[
           _crearInput(),
           Divider(),
           _crearEmail(),
           Divider(),
           _crearPassword(),
           Divider(),
           _crearFecha(context),
           Divider(),
           _crearDropDown(),
           Divider(),
           _crearPersona(),
           Divider(),
         ],
       ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre',
        labelText: 'Nombre',
        helperText: 'Ingresa el nombre por favor.',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor){ 
        setState(() {
        _nombre = valor;          
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: 'Email',
        labelText: 'Email',
        helperText: 'Ingresa el email por favor.',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor){ 
        setState(() {
        _email = valor;          
        });
      },
    );
  }

  Widget  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor){ 
        setState(() {
        _password = valor;          
        });
      },
    );
  }

  Widget  _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picket = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2000),
      lastDate: new DateTime(2050),
      
    );
    if(picket != null){
      setState(() {
        _fecha = picket.toString();
        _inputFieldDateController.text = _fecha;
      });
    }

  }


  List<DropdownMenuItem<String>> getOpcionesDD(){

    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach( (poder) {
      
      lista.add(
        DropdownMenuItem(
          child: Text(poder),
          value: poder,
        )
      );

    });
    return lista;

  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.view_list),
        SizedBox(width: 30.0,),
        DropdownButton(
          value: _poderSeleccionado,
          items: getOpcionesDD(), 
          onChanged: (opt){
            setState(() {
              _poderSeleccionado = opt;
            });
          },
        )
      ],
    ); 
    
  }

  _crearPersona() {

    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_poderSeleccionado),
    );
  }



}