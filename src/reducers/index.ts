import { combineReducers } from 'redux';
import { ayuReducer } from './ayu.reducer';

export const rootReducer = combineReducers({
  ayu: ayuReducer,
});

export type RootState = ReturnType<typeof rootReducer>;
