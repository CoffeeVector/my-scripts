import json

def findFocused(d):
    if d['focused']: return True
    else:
        for i in d['nodes']:
            f = findFocused(i)
            if f:
                if isinstance(f, (bool)):
                    return d['layout']
                else:
                    return f
        return False

d = json.loads(raw_input())

print u'\U00002194'.encode('utf-8') if findFocused(d) == "splith" else u'\U00002195'.encode('utf-8')
