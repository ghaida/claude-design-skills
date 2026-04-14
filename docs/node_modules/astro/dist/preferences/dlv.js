function dlv(obj, key) {
  for (const k of key.split(".")) {
    obj = obj?.[k];
  }
  return obj;
}
export {
  dlv as default
};
