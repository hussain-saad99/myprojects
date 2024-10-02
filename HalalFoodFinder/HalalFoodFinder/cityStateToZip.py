import csv, json
path = "uszips.csv"
file = open("cityToZip.txt", "w")
with open(path, mode='r') as file:
    reader = csv.reader(file)
    
    for row in reader:
        string =  f"{key}:{row[0]}\n"
        file.write(string)
        
##        if key in res:
##                # If it exists, append the ZIP code to the list of values
##                res[key].append(row[0])
##        else:
##                # If it doesn't exist, create a new list with the ZIP code
##                res[key] = [row[0]]


file.close()
