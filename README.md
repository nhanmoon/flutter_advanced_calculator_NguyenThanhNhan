 Tên: Nguyễn Thành Nhân

Mssv: 2224801030136

📱 Lab 3 – Advanced Calculator (Flutter)

---

🎯 1. Mục tiêu bài Lab

- Xây dựng ứng dụng máy tính nâng cao với nhiều chế độ.
- Áp dụng state management (Provider).
- Sử dụng SharedPreferences để lưu:
  - Settings
  - History
  - Memory
  - Last Mode
- Xây dựng UI responsive, có gesture và mode selector.
- Implement scientific features và programmer mode.

---

🚀 2. Chức năng chính 

🧮 **A. Basic Calculator Mode**
- Cộng, trừ, nhân, chia  
- Phần trăm (%)  
- Âm/Dương (±)  
- Xóa ký tự cuối (CE)  
- Xóa toàn bộ (C)  
- Dấu bằng (=)

<img width="1296" height="982" alt="image" src="https://github.com/user-attachments/assets/5418bd02-5c05-4179-8f4c-2b1ef765ced0" />


🔬 **B. Scientific Mode**
Bao gồm thêm các chức năng khoa học:
- sin(), cos(), tan()  
- ln(), log()  
- π  
- √, x², x^y  
- Dấu ngoặc ( ),  
- Angle mode: **DEG / RAD**
- Precision tùy chỉnh: 2–10 chữ số thập phân

<img width="1297" height="983" alt="image" src="https://github.com/user-attachments/assets/ddb37b1d-1ca2-4d23-806a-e6cefc701f96" />


🖥 **C. Programmer Mode**
Hỗ trợ:
- BIN (nhị phân)  
- OCT (bát phân)  
- DEC (thập phân)  
- HEX (thập lục phân)
- AND / OR / XOR / NOT
- Shift: `<<` và `>>`
- Tự chuyển đổi gốc dựa trên input

<img width="1299" height="989" alt="image" src="https://github.com/user-attachments/assets/e1c2e185-551d-4d57-966f-9dd76d108afb" />


📝 **D. Calculation History**
- Tự lưu mỗi phép tính: expression + result + time + mode
- Lưu vào SharedPreferences
- Giới hạn số lượng history (25 / 50 / 100)
- Xóa từng cái hoặc xóa toàn bộ

<img width="1293" height="979" alt="image" src="https://github.com/user-attachments/assets/7500bbc5-e369-4a14-9ca4-13504ecdd598" />

⚙️ **F. Settings **
- Dark / Light Theme  
- Angle Mode (DEG / RAD)
- Sound (On/Off)
- Haptic Feedback  
- Decimal Precision  
- History Size  
- Last Mode Persistence

<img width="1296" height="982" alt="image" src="https://github.com/user-attachments/assets/12d9c231-1930-4075-931f-8ebaec926e1d" />


🎨 **G. UI/UX + Gesture**
- Responsive layout (Grid tự co giãn)  
- Swipe phải để xóa ký tự cuối  
- Animated button  
- Mode Selector (Basic – Scientific – Programmer)  
- Display Area:
  - Expression
  - Result/Error
  - Angle Mode
  - Memory Indicator

🚀 Getting Started
flutter pub get

- Run the app
flutter run

- Run unit tests
flutter test

📂 Project Structure
lib/
 ├── models/                 # Data models
 ├── providers/              # State management (Provider)
 ├── services/               # Storage & theme services
 ├── utils/                  # Parser & calculation logic
 ├── screens/                # Main screens
 ├── widgets/                # Reusable UI components
 🚧 Limitations & Future Improvements

Add multi-gesture support (pinch, swipe-right delete)
Improve keypad layout for scientific mode
Add sound / haptic toggles (if needed)
More advanced graph features: zoom, pan, multiple functions
Add internationalization (i18n)
