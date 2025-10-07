def calc_pwd(imei):
    imei_str = str(imei) if isinstance(imei, int) else imei
    if len(imei_str) != 6:
        print("Must be 6 characters long")
        return None
    result = [str(int(num) * (index + 2))[-1:] for index, num in enumerate(imei_str)]
    return "".join(result[::-1])

