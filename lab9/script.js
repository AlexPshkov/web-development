// ===============================[Ex 1]=================================
/**
 * Check if number is prime
 * @param number
 */
function isPrimeNumber(number) {
    if (number instanceof Array) { //Handle array
        number.forEach(num => isPrimeNumber(num));
        return;
    }
    if (number % 2 === 0 && number > 2) return console.log(number + " is not prime number"); //Simple check
    for (let i = 3; i <= Math.sqrt(number); i += 2) { //Main check
        if (number % i === 0) return console.log(number + " is not prime number");
    }
    return console.log(number + " is prime number");
}

// isPrimeNumber([4, 1, 2, 121]);


// ===============================[Ex 2]=================================
const bracketsRegExp = new RegExp(/[()]/g);
const operationTypeRegExp = new RegExp(/[^(|)\w\d\s][\s|(]/g);
const numberSplitRegExp = new RegExp(/(?<=\d)\s+(?=[^ ]?\d)/g);
const numbersRegExp = new RegExp(/([^ (]?\d+)\s+.([\d]*)/g);

/**
 * Get last index of RegEx in string
 * @param stringExpression
 * @param regEx
 * @returns {*}
 */
function getLastIndex(stringExpression, regEx) {
    const lastOperationTypeMatch = stringExpression.match(regEx).pop();
    return stringExpression.lastIndexOf(lastOperationTypeMatch);
}

/**
 * Check if this is a valid expression
 * @param stringExpression
 * @returns {boolean}
 */
function isValidExpression(stringExpression) {
    const operationTypeMatches = stringExpression.match(operationTypeRegExp);
    const decimalTypeMatches = stringExpression.match(/\d/g);

    const operationalTypeAmount = operationTypeMatches === undefined ? 0 : operationTypeMatches.length;
    const decimalTypeAmount = decimalTypeMatches === undefined ? 0 : decimalTypeMatches.length;
    return  operationalTypeAmount === decimalTypeAmount - 1;
}

/**
 * Calc prefix expression
 * @param expression
 * @param checked
 * @returns {*|string}
 */
function calc(expression, checked = false) {
    if(!checked && !isValidExpression(expression)) return "Error in expression. Please check";
    const stringExpression = expression.replace(bracketsRegExp, " ");
    const lastOperationTypePosition = getLastIndex(stringExpression, operationTypeRegExp);
    const sliceExpression = stringExpression.substring(lastOperationTypePosition);
    const sliceExpressionMatch = sliceExpression.match(numbersRegExp)[0];
    const strValues = sliceExpressionMatch.split(numberSplitRegExp);
    const operationType = stringExpression[lastOperationTypePosition];
    const firstValue = Number.parseInt(strValues[0]);
    const secondValue = Number.parseInt(strValues[1]);

    let result;
    switch (operationType) {
        case "+":
            result = firstValue + secondValue;
            break;
        case "-":
            result = firstValue - secondValue;
            break;
        case "*":
            result = firstValue * secondValue;
            break;
        case "/":
            result = firstValue / secondValue;
            break;
    }

    const fullStr = stringExpression.substring(lastOperationTypePosition, stringExpression.lastIndexOf(sliceExpressionMatch));
    const formattedExpression = stringExpression.replaceAll(fullStr + sliceExpressionMatch, result);

    return formattedExpression.match(operationTypeRegExp) ? calc(formattedExpression, true) : formattedExpression;
}


console.log(calc('*(- 5 6) (* (+ -2 -5)  (+    1 1))'));