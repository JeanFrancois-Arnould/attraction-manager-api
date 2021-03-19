const assert =require('assert');

assert.deepStrictEqual({},{});

try {
    assert.deepStrictEqual(4,5);
} catch (err) {
    console.error(err.message);
}
