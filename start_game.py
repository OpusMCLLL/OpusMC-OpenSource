import pathlib
import shutil
import subprocess
import sys


def main():
    node = shutil.which('node')
    if not node:
        print('Node.js is required to start OpusMC.')
        return 1
    root = pathlib.Path(__file__).resolve().parent
    entry = next((candidate for candidate in (root / 'game' / 'server.js', root / 'server.js') if candidate.is_file()), None)
    if entry is None:
        print('Cannot find game/server.js or server.js next to this launcher.')
        return 1
    try:
        return subprocess.call([node, str(entry), *sys.argv[1:]], cwd=entry.parent)
    except KeyboardInterrupt:
        return 0


if __name__ == '__main__':
    sys.exit(main())
