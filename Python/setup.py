import cx_Freeze

exe = [cx_Freeze.Executable("testWordMatching.py")]

cx_Freeze.setup( name = "testWordMatching", version = "1.0", options = {"build_exe": {"packages": ["errno", "os", "re", "stat", "subprocess","collections", "pprint","shutil", "humanize","pycallgraph"], "include_files": []}}, executables = exe )
