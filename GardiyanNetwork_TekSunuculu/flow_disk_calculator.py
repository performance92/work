import yaml

def calculate_storage(data):
    devices = data["devices"]
    flow_rate = data["flows_per_second"]
    flow_size = data["average_flow_size"]
    compression_ratio = data["compression_ratio"]
    days = data["retention_days"]

    # 1 gün için hesapla
    seconds_per_day = 86400
    daily_raw_bytes = devices * flow_rate * flow_size * seconds_per_day
    daily_compressed_bytes = daily_raw_bytes * compression_ratio

    # Günlük, haftalık, aylık hesapla
    results = {
        "raw_gb_per_day": round(daily_raw_bytes / (1024**3), 2),
        "compressed_gb_per_day": round(daily_compressed_bytes / (1024**3), 2),
        "compressed_gb_total": round((daily_compressed_bytes * days) / (1024**3), 2)
    }

    return results

if __name__ == "__main__":
    with open("flow_calculate.yaml", "r") as f:
        config = yaml.safe_load(f)

    result = calculate_storage(config)

    print("📊 Flow Veri Saklama Tahmini:")
    print(f"  Ham veri (günlük):       {result['raw_gb_per_day']} GB")
    print(f"  Sıkıştırılmış (günlük):  {result['compressed_gb_per_day']} GB")
    print(f"  Toplam ({config['retention_days']} gün):     {result['compressed_gb_total']} GB (sıkıştırılmış)")
