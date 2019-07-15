#summon shutil and os
import shutil
import os
import glob

#realpath creation

MainPath = os.path.dirname(os.path.realpath(".."))

#make Downloads folder copy function
def down_copy(initiate):

    #trigger condition
    if initiate == "y":

        #use glob to find all files in downloads

        downFiles = glob.iglob(os.path.join("../Downloads", "**"))

        #copy each pptx file to the directory ( in my script the folder is in Documents/Class Python/Python Advanced)
        for downFile in downFiles:
            if os.path.isfile(downFile):
                shutil.copy2(downFile, "../Box/PC1/Downloads")


#make Documents folder copy function
def doc_copy(initiate):

    #trigger condition
    if initiate == "y":

        #use glob to find all files in downloads

        docFiles = glob.iglob(os.path.join("../Documents", "**"))

        #copy each pptx file to the directory ( in my script the folder is in Documents/Class Python/Python Advanced)
        for docFile in docFiles:
            if os.path.isfile(docFile):
                shutil.copy2(docFile, "../Box/PC1/Documents")



#call the function
down_copy("y")
doc_copy("y")
