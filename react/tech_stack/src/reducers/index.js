// Index of all the reducers.
// CombineReducers will create a manifest of all reducers and then put them together so RN
// can use it.

import { combineReducers } from 'redux';
import LibraryReducer from './LibraryReducer';
import SelectionReducer from './SelectionReducer';

export default combineReducers({
  libraries: LibraryReducer,
  selectedLibraryId: SelectionReducer
});

// What we'd expect if only libraries : LibraryReducer were in the combine Reducers
// console.log(store.getState());
// {libraries: [] }
