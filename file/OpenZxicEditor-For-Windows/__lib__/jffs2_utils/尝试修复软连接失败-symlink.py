__all__ = ['isbroken', 'lexists', 'read', 'update']


import os


def isbroken(path):
    """return True if symbolic is broken"""
    src = read(path)
    return not os.path.exists(src)


def lexists(path):
    """return True if path exists and is a symbolic link"""
    return os.path.lexists(path)


def read(path):
    """return a string representing the path to which the symbolic link points. The result may be either an absolute or relative pathname"""
    return os.readlink(path)


def update(source, link_name):
    """create or update a symbolic link pointing to source named link_name"""
    link_name = os.path.abspath(os.path.expanduser(link_name))
    if os.path.exists(link_name) and not os.path.islink(link_name):
        raise OSError("%s is not a symlink" % link_name)
    if os.path.lexists(link_name):
        if read(link_name) == source:
            return
        os.unlink(link_name)
    os.symlink(source, link_name)
