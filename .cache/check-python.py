
import os
import sys


IS_WINDOWS = sys.platform.lower().startswith("win")
PYTHON_EXE = sys.executable
CHECK_HTTPS_URLS = ["https://github.com", "https://platformio.org"]


def check_min_version():
    assert (
        sys.version_info >= (2, 7, 9) and sys.version_info < (3,)
    ) or sys.version_info >= (3, 5)


def check_win_custom():
    assert not any(s in PYTHON_EXE.lower() for s in ("msys", "mingw", "emacs"))
    assert os.path.isdir(os.path.join(sys.prefix, "Scripts")) or (
        sys.version_info >= (3, 5) and __import__("venv")
    )


def check_urllib_ssl():
    for url in CHECK_HTTPS_URLS:
        if url_status_ok(url):
            return True
    return False


def url_status_ok(url):
    for f in (
        urllib_url_status_ok,
        urllib3_url_status_ok,
        requests_url_status_ok,
    ):
        try:
            assert f(url)
            return True
        except Exception as e:
            print(e)
    return False


def urllib_url_status_ok(url):
    try:
        from urllib.request import urlopen
    except ImportError:
        from urllib import urlopen
    try:
        return int(urlopen(url).getcode()) == 200
    except:
        return False


def urllib3_url_status_ok(url):
    import urllib3

    try:
        return int(urllib3.PoolManager().request("GET", url).status) == 200
    except:
        return False


def requests_url_status_ok(url):
    import requests

    r = requests.get(url)
    r.raise_for_status()
    return True


if __name__ == "__main__":
    # we do not support cygwin
    assert sys.platform != "cygwin"

    check_min_version()

    if IS_WINDOWS:
        check_win_custom()

    assert check_urllib_ssl()

    print(PYTHON_EXE)
    sys.exit(0)

