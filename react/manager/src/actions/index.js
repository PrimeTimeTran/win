// Curly braces because there are many things in the types.js file. We specifically want EMAIL_CHANGED
import {
  EMAIL_CHANGED,
  PASSWORD_CHANGED
 } from './types';

export const emailChanged = (text) => {
  return {
    type: EMAIL_CHANGED, // Forms a strong link between this #Action and the #Reducer
    payload: text
  };
};

export const passwordChanged = (text) => {
  return {
    type: PASSWORD_CHANGED,
    payload: text
  };
};
