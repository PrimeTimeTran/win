import {
  EMAIL_CHANGED,
  PASSWORD_CHANGED
 } from '../actions/types';

const INITIAL_STATE = {
  email: '',
  password: ''
};

export default (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case EMAIL_CHANGED:
      // Create a new object with the properties of state. Create
      // a new property of email. If there is already an email, overwrite it.
      // This is how well tell Redux something has changed in the state.
      return { ...state, email: action.payload };

    case PASSWORD_CHANGED:
      return { ...state, password: action.payload };

    default:
      return state;
  }
};
