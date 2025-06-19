function CHAR.FUNC.op(op,n1,n2)
if op == 'sub' then
return n1 - n2
end
if op == 'add' then
return n1 + n2
end
if op == 'mul' then
return n1 * n2
end
if op == 'div' then
return n1 / n2
end
if op == 'expn' then
return n1 ^ n2
end
if op == 'expo' then
return math.exp(n1)
end
end