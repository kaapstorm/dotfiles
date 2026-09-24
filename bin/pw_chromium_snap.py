"""
Use system Chromium snap to launch Playwright
"""
from playwright.sync_api._generated import BrowserType

_launch = BrowserType.launch


def _launch_system_chromium(self, *args, **kwargs):
    kwargs.setdefault('executable_path', '/snap/bin/chromium')
    return _launch(self, *args, **kwargs)


BrowserType.launch = _launch_system_chromium
