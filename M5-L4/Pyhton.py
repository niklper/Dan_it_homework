def function(file_path):

    log_levels = {
        "INFO" : 0,
        "ERROR" : 0,
        "WARNING" : 0
    }

    with open(file_path,"r") as file:
        for line in file.readlines():
            
            if "INFO" in line:
                log_levels["INFO"] += 1
            
            if "ERROR" in line:
                log_levels["ERROR"] += 1
            
            if "WARNING" in line:
                log_levels["WARNING"] += 1
            
    return log_levels

def extract_lines(file_path, filter="ERROR"):
    list_errors = []
    with open(file_path,"r") as file:
        for line in file.readlines():
            if filter in line:
                list_errors.append(line)
    return list_errors
    
def extract_user_name(file_path, filter="user="):
    result = set()
    with open(file_path,"r") as file:
        for line in file.readlines():
            if filter in line:
                splited_line = line.split(" ")
                for item in splited_line:
                    if filter in item:
                        name = item.strip("\n")[5:]
                        result.add(name)
    return result

def extract_ip(file_path, filter="ip="):
    result = set()
    with open(file_path,"r") as file:
        for line in file.readlines():
            if filter in line:
                splited_line = line.split(" ")
                for item in splited_line:
                    if filter in item:
                        filter_length = len(filter)
                        name = item.strip("\n")[filter_length:]
                        result.add(name)
    return result

def main():
    v_file_path = r"C:\Users\koly0\OneDrive\Рабочий стол\Dan_it_homework\M5-L4\log.txt"
    # count_words = function(v_file_path)
    # count_ERRORS_lines = extract_lines(v_file_path, "ERROR")
    # print(count_words)
    # print(count_ERRORS_lines)
    extracted_names = extract_user_name(v_file_path, "user=")
    print(extracted_names)
    extracted_ip = extract_ip(v_file_path, "ip=")
    print(extracted_ip)


if __name__ == "__main__":
    main()