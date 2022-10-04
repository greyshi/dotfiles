import subprocess

output = subprocess.run(["yabai","-m","query","--displays"],capture_output=True,text=True)
output_text = output.stdout.strip()
output_obj = eval(output_text)
width = (output_obj[0]["frame"]["w"])

if width in [1512.0, 1496.0, 1728.0]:
    subprocess.run(["yabai","-m","config","top_padding","10"])
    print("Padding set to 10")
else:
    subprocess.run(["yabai","-m","config","top_padding","45"])
    print("Padding set to 45")