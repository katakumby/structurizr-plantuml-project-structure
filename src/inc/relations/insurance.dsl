            user -> webapp
            webapp -> service1Api
            service1Api -> service2Api
            service1Api -> service3Api
            service2Api -> service4Api
            service2Api -> service5Api
            webapp -> service3Api
            service3Api -> service4Api
            service3Api -> service7Api
            service4Api -> service6Api
            service7Api -> service8Api

            service2Api -> signinController "Some component to component"