# 📝 Go Todo API (Docker + SQLite)

Bu proje, **Go** dilinde yazılmış basit bir **Todo API servisidir**.  
Veriler **SQLite** veritabanında saklanır ve uygulama **Docker** üzerinde çalışır.  
Ayrıca `curl` veya tarayıcı üzerinden API istekleriyle Todo görevleri yönetilebilir.

---

## 🚀 Özellikler
- ✅ Todo ekleme, listeleme ve silme işlemleri  
- 🧱 SQLite veritabanı kullanımı  
- 🐳 Docker ile kolay kurulum ve çalıştırma  
- 🔄 Geliştirici dostu yapı (Air ile canlı yeniden başlatma desteği — opsiyonel)

---

## 📂 Proje Yapısı

todo-app/
├── app/
│ ├── main.go
│ ├── database.go
│ ├── handlers.go
│ ├── models.go
│ ├── todos.db
│ └── go.mod
├── Dockerfile
├── docker-compose.yml
└── README.md

yaml
Copy code

---

## ⚙️ Kurulum

### 1️⃣ Projeyi klonla
```bash
git clone https://github.com/kullaniciadi/todo-app.git
cd todo-app
2️⃣ Docker imajını oluştur
bash
Copy code
docker compose build
3️⃣ Uygulamayı çalıştır
bash
Copy code
docker compose up
4️⃣ Başarılı çalışıyorsa şu çıktıyı göreceksin:
pgsql
Copy code
Server running on :8080
Connected to /data/todos.db
🧠 API Kullanımı
➕ Yeni Todo Ekle
bash
Copy code
curl -X POST -H "Content-Type: application/json" \
-d '{"title": "Docker öğren", "completed": false}' \
http://localhost:8080/todos
📜 Tüm Todoları Listele
bash
Copy code
curl http://localhost:8080/todos
🗑️ Todo Sil
bash
Copy code
curl -X DELETE http://localhost:8080/todos/1
💾 Veritabanı
SQLite dosyası todos.db olarak oluşturulur.

Docker konteyneri durduğunda veri kaybolmasın diye docker-compose.yml içinde /data klasörüne bağlanmıştır:

yaml
Copy code
volumes:
  - ./data:/data
🔧 Geliştirme Modu (Opsiyonel)
Canlı kod değişimi için air aracı kullanılabilir:

bash
Copy code
go install github.com/air-verse/air@latest
air
🧹 Temizlik Komutları
bash
Copy code
docker compose down --volumes
docker rmi go-todo
