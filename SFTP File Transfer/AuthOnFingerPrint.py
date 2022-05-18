import hashlib as hl


def trim_fingerprint(fingerprint):
    #if fingerprint.startswith('ecdsa-sha2-nistp384 384 '):
        #return fingerprint[len('ecdsa-sha2-nistp384 384 '):]
    return fingerprint


def clean_fingerprint(fingerprint):
    #return trim_fingerprint(fingerprint).replace(':', '')
    return trim_fingerprint(fingerprint)

class FingerprintKey:

    def __init__(self, fingerprint):
        self.fingerprint = clean_fingerprint(fingerprint)

    def compare(self, other):
        if callable(getattr(other, "get_fingerprint", None)):
            return other.get_fingerprint() == self.fingerprint
        elif clean_fingerprint(other) == self.get_fingerprint():
            return True
        #elif hl.md5(other).digest().encode('hex') == self.fingerprint:
        elif hl.md5(other).hexdigest() == self.fingerprint:
            return True
        else:
            return False

    def __cmp__(self, other):
        return self.compare(other)

    def __contains__(self, other):
        return self.compare(other)

    def __eq__(self, other):
        return self.compare(other)

    def __ne__(self, other):
        return not self.compare(other)

    def get_fingerprint(self):
        return self.fingerprint

    def get_name(self):
        return u'ecdsa-sha2-nistp384'

    def asbytes(self):
         # Note: This returns itself.
         #   That way when comparisons are done to asbytes return value,
         #   this class can handle the comparison.
        return self