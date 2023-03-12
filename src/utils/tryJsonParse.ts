export const tryJsonParse = (value) => {
  if (!value) return undefined;
  try {
    return JSON.parse(value);
  } catch (error) {
    return undefined;
  }
}