import { createContext } from "react";

export const LoadingContext = createContext({
  loading: false,
  progress: 0,
});
