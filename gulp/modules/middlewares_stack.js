export default (stack, req, res, next) => {
  if (typeof stack === 'function') {
    stack = [stack];
  }

  const walkStack = (i, err) => {
    if (err) return next(err);
    if (i >= stack.length) return next();

    stack[i](req, res, walkStack.bind(null, i + 1));
  };

  walkStack(0);
};
