require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u",
		cpp = "cd $dir && g++ --std=c++14 $fileName -o $fileNameWithoutExt.out && ./$fileNameWithoutExt.out"
	},
})
