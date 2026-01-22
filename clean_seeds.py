import os

# List all your seed files
seed_files = [
    "seeds/raw_customers.csv",
    "seeds/raw_orders.csv",
    "seeds/raw_payments.csv"
]

for file_path in seed_files:
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        continue

    with open(file_path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    # Remove starting and ending quotes from each line
    cleaned_lines = [line.strip().strip('"') + "\n" for line in lines]

    with open(file_path, "w", encoding="utf-8") as f:
        f.writelines(cleaned_lines)

    print(f"Cleaned {file_path}")
