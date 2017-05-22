import React, { Component } from 'react';
import { Text } from 'react-native';
import { Button, Card, CardSection, Input, Spinner } from './common';
import firebase from 'firebase';

class LoginForm extends Component {
  state = { email: '', password: '', error: '', loading: false }; // Initialize the initial state of the email property as an empty string

  onButtonPress() {
    // Sets email and password property from value of inputs
    const { email, password } = this.state;

    // Clears Error Message from previous attempt & manages loading state
    this.setState({ error: '', loading: true });

    // Logic that handles the Login
    firebase.auth().signInWithEmailAndPassword(email, password) // Attempts to SignIn
      .then(this.onLoginSuccess.bind(this))
      .catch(() => { // Catches if SignIn Fails
        firebase.auth().createUserWithEmailAndPassword(email, password) // Attemps to create an account
          .then(this.onLoginSuccess.bind(this))
          .catch(this.onLoginFail.bind(this));
      });
  }

    onLoginFail() {
      this.setState({ error: 'Authentication Failed', loading: false });  // Flashes error message
    }

    onLoginSuccess() {
      this.setState({
        email: '',
        password: '',
        loading: false,
        error: ''
      });
    }

  // Logic to determine whether or not to display the spinner or the button
  renderButton() {
    if (this.state.loading) {
      return <Spinner size="small" />;
    }
    return (
      <Button onPress={this.onButtonPress.bind(this)}>
        Log In
      </Button>
    );
  }

  render() {
    return (
      <Card>
        <CardSection>
          <Input
            placeholder="user@gmail.com"
            label="Email"
            value={this.state.email} // Sets the state as the text
            onChangeText={email => this.setState({ email })} // Calls function that changes the state onChangeText
          />
        </CardSection>

        <CardSection>
          <Input
            secureTextEntry
            placeholder="password"
            label="Password"
            value={this.state.password}
            onChangeText={password => this.setState({ password })}
          />
        </CardSection>

        <Text style={styles.errorTextStyle}>
          {this.state.error}
        </Text>

        <CardSection>
          {/* Calls renderButton helper method */}
          {this.renderButton()}
        </CardSection>
      </Card>
    );
  }
}

const styles = {
  errorTextStyle: {
    fontSize: 20,
    alignSelf: 'center',
    color: 'red'
  }
}

export default LoginForm;
