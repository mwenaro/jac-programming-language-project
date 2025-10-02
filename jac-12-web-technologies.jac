# Web Technologies with Jac
# Building modern web applications and APIs

def web_technologies_demo() -> None {
    print("=== JAC WEB DEVELOPMENT OVERVIEW ===");
    print("Jac can power modern web applications through various approaches");
    
    print("\n=== REST API DEVELOPMENT ===");
    
    # Simulated REST API structure
    def create_api_server(name: str, port: int) -> dict {
        return {
            "name": name,
            "port": port,
            "routes": [],
            "middleware": [],
            "running": False
        };
    }
    
    def add_route(server: dict, method: str, path: str, handler: str) -> None {
        route = {
            "method": method.upper(),
            "path": path,
            "handler": handler,
            "parameters": [],
            "responses": {}
        };
        server["routes"].append(route);
        print(f"Added route: {method.upper()} {path} -> {handler}");
    }
    
    def add_middleware(server: dict, name: str, purpose: str) -> None {
        middleware = {
            "name": name,
            "purpose": purpose,
            "enabled": True
        };
        server["middleware"].append(middleware);
        print(f"Added middleware: {name} ({purpose})");
    }
    
    # Create a sample API server
    print("\nCreating REST API Server:");
    api_server = create_api_server("Jac Blog API", 8000);
    
    # Add middleware
    add_middleware(api_server, "CORS", "Cross-origin resource sharing");
    add_middleware(api_server, "Auth", "JWT authentication");
    add_middleware(api_server, "Logging", "Request/response logging");
    add_middleware(api_server, "RateLimit", "API rate limiting");
    
    # Add routes
    add_route(api_server, "GET", "/api/posts", "get_all_posts");
    add_route(api_server, "GET", "/api/posts/{id}", "get_post_by_id");
    add_route(api_server, "POST", "/api/posts", "create_post");
    add_route(api_server, "PUT", "/api/posts/{id}", "update_post");
    add_route(api_server, "DELETE", "/api/posts/{id}", "delete_post");
    add_route(api_server, "GET", "/api/users/profile", "get_user_profile");
    add_route(api_server, "POST", "/api/auth/login", "user_login");
    add_route(api_server, "POST", "/api/auth/register", "user_register");
    
    print(f"\nAPI server configured with {len(api_server['routes'])} routes");
    
    print("\n=== DATABASE INTEGRATION SIMULATION ===");
    
    # Simulated database operations
    def create_database_connection(db_type: str, host: str, database: str) -> dict {
        return {
            "type": db_type,
            "host": host,
            "database": database,
            "connected": False,
            "models": []
        };
    }
    
    def define_model(db: dict, name: str, fields: dict) -> None {
        model = {
            "name": name,
            "fields": fields,
            "relationships": [],
            "indexes": []
        };
        db["models"].append(model);
        print(f"Defined model: {name} with fields: {list(fields.keys())}");
    }
    
    # Set up database
    print("\nSetting up Database:");
    db = create_database_connection("PostgreSQL", "localhost", "blog_db");
    
    # Define models
    user_fields = {
        "id": "auto_increment",
        "username": "string",
        "email": "string",
        "password_hash": "string", 
        "created_at": "timestamp",
        "updated_at": "timestamp"
    };
    define_model(db, "User", user_fields);
    
    post_fields = {
        "id": "auto_increment",
        "title": "string",
        "content": "text",
        "author_id": "foreign_key",
        "published": "boolean",
        "created_at": "timestamp",
        "updated_at": "timestamp"
    };
    define_model(db, "Post", post_fields);
    
    comment_fields = {
        "id": "auto_increment",
        "post_id": "foreign_key",
        "author_id": "foreign_key",
        "content": "text",
        "created_at": "timestamp"
    };
    define_model(db, "Comment", comment_fields);
    
    print(f"\nDatabase configured with {len(db['models'])} models");
    
    print("\n=== API HANDLER SIMULATION ===");
    
    # Simulated API handlers
    def handle_get_posts(query_params: dict) -> dict {
        print(f"GET /api/posts called with params: {query_params}");
        
        # Simulate database query
        posts = [
            {
                "id": 1,
                "title": "Introduction to Jac",
                "content": "Jac is a powerful programming language...",
                "author": "John Doe",
                "published": True,
                "created_at": "2024-01-15T10:00:00Z"
            },
            {
                "id": 2,
                "title": "Building Web APIs with Jac",
                "content": "Learn how to create RESTful APIs...",
                "author": "Jane Smith", 
                "published": True,
                "created_at": "2024-01-20T14:30:00Z"
            }
        ];
        
        # Apply filters
        if "author" in query_params {
            author_filter = query_params["author"];
            posts = [p for p in posts if p["author"] == author_filter];
        }
        
        return {
            "status": 200,
            "data": {
                "posts": posts,
                "total": len(posts),
                "page": 1
            }
        };
    }
    
    def handle_create_post(post_data: dict) -> dict {
        print(f"POST /api/posts called with data: {post_data}");
        
        # Validate required fields
        required_fields = ["title", "content", "author_id"];
        for field in required_fields {
            if field not in post_data {
                return {
                    "status": 400,
                    "error": f"Missing required field: {field}"
                };
            }
        }
        
        # Simulate creating post
        new_post = {
            "id": 3,
            "title": post_data["title"],
            "content": post_data["content"],
            "author_id": post_data["author_id"],
            "published": post_data.get("published", False),
            "created_at": "2024-01-25T09:15:00Z"
        };
        
        return {
            "status": 201,
            "data": {
                "post": new_post,
                "message": "Post created successfully"
            }
        };
    }
    
    def handle_user_authentication(credentials: dict) -> dict {
        print(f"POST /api/auth/login called");
        
        # Simulate authentication
        if "username" not in credentials or "password" not in credentials {
            return {
                "status": 400,
                "error": "Username and password required"
            };
        }
        
        # Simulate user lookup
        if credentials["username"] == "john" and credentials["password"] == "secret123" {
            return {
                "status": 200,
                "data": {
                    "token": "jwt_token_here_abc123",
                    "user": {
                        "id": 1,
                        "username": "john",
                        "email": "john@example.com"
                    },
                    "expires_in": 3600
                }
            };
        } else {
            return {
                "status": 401,
                "error": "Invalid credentials"
            };
        }
    }
    
    # Test API handlers
    print("\nTesting API Handlers:");
    
    # Test getting posts
    result1 = handle_get_posts({"author": "John Doe"});
    print(f"Get posts result: Status {result1['status']}, Found {len(result1['data']['posts'])} posts");
    
    # Test creating a post
    new_post_data = {
        "title": "Advanced Jac Techniques",
        "content": "This post covers advanced programming patterns...",
        "author_id": 1,
        "published": True
    };
    result2 = handle_create_post(new_post_data);
    print(f"Create post result: Status {result2['status']}, Message: {result2['data']['message']}");
    
    # Test authentication
    login_data = {"username": "john", "password": "secret123"};
    result3 = handle_user_authentication(login_data);
    print(f"Auth result: Status {result3['status']}, Token received: {'token' in result3.get('data', {})}");
    
    print("\n=== FRONTEND INTEGRATION ===");
    
    # Simulated frontend interaction patterns
    def simulate_ajax_request(method: str, url: str, data: dict = {}) -> dict {
        print(f"AJAX {method} request to {url}");
        
        # Simulate different responses based on URL
        if url == "/api/posts" and method == "GET" {
            return handle_get_posts(data);
        } elif url == "/api/posts" and method == "POST" {
            return handle_create_post(data);
        } elif url == "/api/auth/login" and method == "POST" {
            return handle_user_authentication(data);
        } else {
            return {"status": 404, "error": "Endpoint not found"};
        }
    }
    
    def simulate_frontend_app() -> None {
        print("\nSimulating Frontend Application:");
        
        # Simulate user login
        print("1. User attempts login...");
        login_response = simulate_ajax_request("POST", "/api/auth/login", {
            "username": "john",
            "password": "secret123"
        });
        
        if login_response["status"] == 200 {
            print("   ✓ Login successful");
            token = login_response["data"]["token"];
            
            # Simulate loading posts
            print("2. Loading blog posts...");
            posts_response = simulate_ajax_request("GET", "/api/posts");
            if posts_response["status"] == 200 {
                posts = posts_response["data"]["posts"];
                print(f"   ✓ Loaded {len(posts)} posts");
                
                # Display posts
                for post in posts {
                    print(f"   - {post['title']} by {post['author']}");
                }
            }
            
            # Simulate creating a new post
            print("3. Creating new post...");
            create_response = simulate_ajax_request("POST", "/api/posts", {
                "title": "My First Jac App",
                "content": "I just built my first web app with Jac!",
                "author_id": 1
            });
            
            if create_response["status"] == 201 {
                print("   ✓ Post created successfully");
            }
        } else {
            print("   ✗ Login failed");
        }
    }
    
    simulate_frontend_app();
    
    print("\n=== WEBSOCKET SIMULATION ===");
    
    # Real-time features simulation
    def create_websocket_server(port: int) -> dict {
        return {
            "port": port,
            "connections": [],
            "rooms": {},
            "message_handlers": {}
        };
    }
    
    def add_connection(server: dict, user_id: int, connection_id: str) -> None {
        connection = {
            "user_id": user_id,
            "connection_id": connection_id,
            "joined_rooms": [],
            "connected_at": "2024-01-25T10:00:00Z"
        };
        server["connections"].append(connection);
        print(f"User {user_id} connected with ID {connection_id}");
    }
    
    def join_room(server: dict, connection_id: str, room_name: str) -> None {
        # Find connection
        connection = None;
        for conn in server["connections"] {
            if conn["connection_id"] == connection_id {
                connection = conn;
                break;
            }
        }
        
        if connection {
            connection["joined_rooms"].append(room_name);
            if room_name not in server["rooms"] {
                server["rooms"][room_name] = [];
            }
            server["rooms"][room_name].append(connection_id);
            print(f"Connection {connection_id} joined room '{room_name}'");
        }
    }
    
    def broadcast_to_room(server: dict, room_name: str, message: dict) -> None {
        if room_name in server["rooms"] {
            connections_in_room = server["rooms"][room_name];
            print(f"Broadcasting to room '{room_name}' ({len(connections_in_room)} connections):");
            print(f"  Message: {message}");
            
            for conn_id in connections_in_room {
                print(f"  -> Sent to connection {conn_id}");
            }
        }
    }
    
    # Simulate real-time chat
    print("\nSimulating Real-time Chat:");
    ws_server = create_websocket_server(8001);
    
    # Users connect
    add_connection(ws_server, 1, "conn_001");
    add_connection(ws_server, 2, "conn_002");
    add_connection(ws_server, 3, "conn_003");
    
    # Users join chat room
    join_room(ws_server, "conn_001", "general");
    join_room(ws_server, "conn_002", "general");
    join_room(ws_server, "conn_003", "tech-talk");
    
    # Simulate messages
    broadcast_to_room(ws_server, "general", {
        "type": "message",
        "user": "john",
        "text": "Hello everyone!",
        "timestamp": "2024-01-25T10:05:00Z"
    });
    
    broadcast_to_room(ws_server, "tech-talk", {
        "type": "message", 
        "user": "alice",
        "text": "Anyone tried Jac for web development?",
        "timestamp": "2024-01-25T10:06:00Z"
    });
    
    print("\n=== WEB FRAMEWORK INTEGRATION PATTERNS ===");
    
    print("JAC + MODERN WEB STACK:");
    print("1. Backend API (Jac + FastAPI/Flask):");
    print("   • REST/GraphQL APIs");
    print("   • Database integration");
    print("   • Authentication & authorization");
    print("   • File upload/processing");
    
    print("\n2. Frontend (React/Vue/Angular + Jac API):");
    print("   • Single Page Applications (SPA)");
    print("   • Server-Side Rendering (SSR)");
    print("   • Progressive Web Apps (PWA)");
    print("   • Mobile-responsive design");
    
    print("\n3. Real-time Features:");
    print("   • WebSocket connections");
    print("   • Server-Sent Events (SSE)");
    print("   • Live notifications");
    print("   • Collaborative editing");
    
    print("\n4. DevOps & Deployment:");
    print("   • Containerization (Docker)");
    print("   • Cloud deployment (AWS/GCP/Azure)");
    print("   • CI/CD pipelines");
    print("   • Load balancing & scaling");
    
    print("\n=== SECURITY BEST PRACTICES ===");
    
    security_practices = [
        "1. Input validation and sanitization",
        "2. SQL injection prevention",
        "3. Cross-Site Scripting (XSS) protection", 
        "4. Cross-Site Request Forgery (CSRF) tokens",
        "5. HTTPS/TLS encryption",
        "6. JWT token security",
        "7. Rate limiting and DDoS protection",
        "8. Secure password hashing",
        "9. API versioning and deprecation",
        "10. Regular security audits"
    ];
    
    for practice in security_practices {
        print(f"   • {practice}");
    }
    
    print("\n=== NEXT STEPS FOR WEB DEVELOPMENT ===");
    
    next_steps = [
        "1. Learn a web framework (FastAPI, Flask, or Django)",
        "2. Set up database integration (PostgreSQL, MongoDB)",
        "3. Implement authentication and authorization",
        "4. Build RESTful APIs with proper documentation",
        "5. Add real-time features with WebSockets",
        "6. Integrate with frontend frameworks",
        "7. Implement caching strategies (Redis)",
        "8. Set up monitoring and logging",
        "9. Deploy to cloud platforms",
        "10. Learn about microservices architecture"
    ];
    
    for step in next_steps {
        print(f"   • {step}");
    }
}

with entry {
    web_technologies_demo();
}
